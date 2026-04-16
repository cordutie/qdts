# ==============================
# Imports
# ==============================
import torch
import torch.nn as nn
import torch.nn.functional as torch_functional

# ==============================
# Model Creator
# ==============================
def model_creator(n=8, hidden_size=64, num_layers=3):
    return HomogeneousInverse(n, hidden_size, num_layers)

class HomogeneousInverse(nn.Module):
    """
    Models G : R^n -> R^{n+1}, homogeneous of degree 1/2
    """
    def __init__(self, n: int = 8, hidden_size: int = 64, num_layers: int = 3) -> None:
        super().__init__()
        self.n: int = n
        self.hidden_size: int = hidden_size
        self.num_layers: int = num_layers

        layers: list[nn.Module] = [nn.Linear(n, hidden_size), nn.SiLU()]
        for _ in range(num_layers - 1):
            layers += [nn.Linear(hidden_size, hidden_size), nn.ReLU()]
        layers.append(nn.Linear(hidden_size, n + 1))
        self.g: nn.Sequential = nn.Sequential(*layers)

        # Initialize weights
        for m in self.g:
            if isinstance(m, nn.Linear):
                nn.init.xavier_uniform_(m.weight)
                if m.bias is not None:
                    nn.init.zeros_(m.bias)

    def local_distortion_function(X: torch.Tensor) -> torch.Tensor:
        """
        Compute lagged dot products (anti-diagonal sums) of X with itself.
        """
        assert X.dim() == 2
        B, N = X.shape

        Z = torch.zeros((B, N-1), dtype=X.dtype, device=X.device)

        for i in range(N - 1):
            k = i + 1
            SN = torch.cat(
                [X[:, k:], torch.zeros((B, k), dtype=X.dtype, device=X.device)],
                dim=1,
            )
            Z[:, N - 1 - i - 1 ] = torch.sum(X * SN, dim=1) # fill it backwards for comptibility with the paper
        
        return Z

    def forward(self, T: torch.Tensor) -> torch.Tensor:
        eps: float = 1e-12
        norm: torch.Tensor = torch.sqrt(torch.sum(T * T, dim=1, keepdim=True)).clamp(min=eps)
        T_unit: torch.Tensor = T / norm
        return self.g(T_unit) * torch.sqrt(norm)

    def forward_clamped(self, T: torch.Tensor) -> torch.Tensor:
        output: torch.Tensor = self.forward(T)
        return torch.clamp(output, min=-2.0, max=2.0)
    
    def error(self, T: torch.Tensor) -> torch.Tensor:
        X_hat: torch.Tensor = self.forward(T)
        T_hat: torch.Tensor = self.local_distortion_function(X_hat)
        return torch_functional.mse_loss(T_hat, T)
    
    def error_clamped(self, T: torch.Tensor) -> torch.Tensor:
        X_hat: torch.Tensor = self.forward_clamped(T)
        T_hat: torch.Tensor = self.local_distortion_function(X_hat)
        return torch_functional.mse_loss(T_hat, T)