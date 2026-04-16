# ==============================
# Imports
# ==============================
import torch
import torch.nn as nn
import torch.nn.functional as torch_functional

# ==============================
# Random Dataset Generator
# ==============================
def generate_random_ball_batch(batch_size, n, radius, device=None):
    """Generate a batch of random points in an n-dimensional ball of given radius centered at (0.5, 0.5, ..., 0.5)."""
    if device is None:
        device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    return torch.rand(batch_size, n, device=device) * radius + 0.5

# ==============================
# Distortion Function
# ==============================
def distortion_function(X: torch.Tensor) -> torch.Tensor:
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

# ==============================
# Losses Functions
# ==============================
def loss_inverse_distortion(X_hat, T):
    """Make sure the model approximate the inverse of the distortion function."""
    T_hat = distortion_function(X_hat)
    return torch_functional.mse_loss(T_hat, T)

def reg_one(X_hat, T):
    """Make sure the first coordinate of X_hat is close to 1 on average."""
    return torch_functional.mse_loss(X_hat[:, 0], torch.ones_like(X_hat[:, 0]))

def reg_zero(X_hat, T):
    """Make sure the coordinates of X_hat are not too large on average."""
    return torch_functional.mse_loss(X_hat, torch.zeros_like(X_hat))

# ==============================
# Training Loop
# ==============================
def train_model(
    model,
    epochs,
    batches_per_epoch,
    batch_size,
    n,
    data_radius,
    lr=1e-3,
    weight_reg_one  = 0.0,
    weight_reg_zero = 0.0,
    device=None,
):
    """Train the model on a random dataset with a ball shape."""

    if device is None:
        device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = model.to(device)
    optimizer = torch.optim.Adam(model.parameters(), lr=lr)
    history = []

    for ep in range(epochs):
        epoch_loss = 0.0

        for _ in range(batches_per_epoch):
            T = generate_random_ball_batch(batch_size, n, data_radius, device=device)

            optimizer.zero_grad()
            X_hat = model(T)

            loss = loss_inverse_distortion(X_hat, T) 
            if weight_reg_one > 0:
                loss += weight_reg_one * reg_one(X_hat, T)
            if weight_reg_zero > 0:
                loss += weight_reg_zero * reg_zero(X_hat, T)

            loss.backward()
            optimizer.step()

            epoch_loss += loss.item()

        history.append(epoch_loss / batches_per_epoch)

    return model, {"loss_history": history}

# ==============================
# Validation
# ==============================
def validate_model(model, 
                   n, 
                   val_batch_size=2048,
                   data_radius=0.5,
                   device=None
):
    """
    Validate a model on a random batch.
    
    Args:
        model: The model to validate (already in eval mode)
        n: Input/output dimension
        val_batch_size: Size of validation batch
        data_radius: Radius for data generation
    
    Returns:
        dict: Dictionary with validation losses
    """
    if device is None:
        device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = model.to(device)
    model.eval()
    with torch.no_grad():
        T_val = generate_random_ball_batch(val_batch_size, n, data_radius, device=device)
        X_hat_val = model(T_val)
        
        # Full validation on all losses and regularizers
        val_loss_inverse_distortion = loss_inverse_distortion(X_hat_val, T_val).item()
        val_reg_one                 = reg_one(X_hat_val, T_val).item()
        val_reg_zero                = reg_zero(X_hat_val, T_val).item()

        # Validation with clamping to check if the model is producing extreme values
        X_hat_val_clamped = torch.clamp(X_hat_val, min=-2., max=2.)
        val_loss_inverse_distortion_clamped = loss_inverse_distortion(X_hat_val_clamped, T_val).item()
        val_reg_one_clamped                 = reg_one(X_hat_val_clamped, T_val).item()
        val_reg_zero_clamped                = reg_zero(X_hat_val_clamped, T_val).item()
    
    return {
        'loss_inverse_distortion': val_loss_inverse_distortion,
        'reg_one': val_reg_one,
        'reg_zero': val_reg_zero,
        'loss_inverse_distortion_clamped': val_loss_inverse_distortion_clamped,
        'reg_one_clamped': val_reg_one_clamped,
        'reg_zero_clamped': val_reg_zero_clamped,
    }
