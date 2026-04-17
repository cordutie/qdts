
# ==============================
# Imports
# ==============================
import torch
import torch.nn as nn
from qdts_nn.model import model_creator

# ==============================
# Save/Load
# ==============================
def save_model(model, path, n, hidden_size, num_layers):
    """
    Save model with minimal necessary information for loading.
    
    Args:
        model: The model to save
        path: Path to save the model
        n: Input/output dimension
        hidden_size: Hidden layer size
        num_layers: Number of layers
    """
    torch.save({
        'state_dict': model.state_dict(),
        'n': n,
        'hidden_size': hidden_size,
        'num_layers': num_layers,
    }, path)

def load_model(path, device=None):
    """
    Load a model from path. All necessary info is stored in the checkpoint.
    
    Args:
        path: Path to the saved model
    
    Returns:
        model: Loaded model in eval mode
    """
    checkpoint = torch.load(path, map_location="cpu")
    
    # Extract model configuration
    n = checkpoint['n']
    hidden_size = checkpoint['hidden_size']
    num_layers = checkpoint['num_layers']
    
    # Create and load model
    model = model_creator(n=n, hidden_size=hidden_size, num_layers=num_layers)
    model.load_state_dict(checkpoint['state_dict'])
    model.eval()

    if device is None:
        device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
    model = model.to(device)
    
    return model

# ==============================
# Serialization
# ==============================
def save_model_serialized(model: nn.Module, path: str) -> None:
    """
    Save a PyTorch model as a TorchScript serialized model (.ts).
    Moves model to CPU for maximum portability before scripting.
    
    Args:
        model: PyTorch model already loaded (nn.Module)
        path: Path to save the serialized TorchScript model (will use .ts extension)
    """
    # Ensure path has .ts extension
    if not path.endswith('.ts'):
        path = path.rsplit('.', 1)[0] + '.ts' if '.' in path else path + '.ts'
    
    # Remember training state to restore it later
    is_train = model.training
    model.eval()
    
    # Unwrap DDP/DataParallel if present
    model_to_save = getattr(model, "module", model)
    
    # Move to CPU for portability (works across different machines/CUDA setups)
    model_cpu = model_to_save.cpu()
    
    # Script the model
    try:
        scripted_model: torch.jit.ScriptModule = torch.jit.script(model_cpu)
    except Exception as e:
        raise RuntimeError(f"Failed to script the model: {e}")
    
    # Save the scripted model
    with open(path, "wb") as f:
        torch.jit.save(scripted_model, f)
    
    print(f"Serialized model saved at: {path}")
    
    # Restore training state if it was in training mode
    if is_train:
        model.train()