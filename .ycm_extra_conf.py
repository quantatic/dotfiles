import os

def Settings(**kwargs):
    return {
        'flags': ['-x', 'c', '-Wall', '-Wextra', '-Werror'],
        'interpreter_path': "/usr/bin/python3",
    }
