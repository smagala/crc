from pkg_resources import get_distribution

try:
    __version__ = get_distribution("clockwork").version
except:
    __version__ = "local"

__all__ = [
    "contam_remover",
    "utils",
]

from clockwork import *
