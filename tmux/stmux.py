#!/usr/bin/env python3

import os
import sys
import random
import subprocess
from prompt_toolkit import prompt
from prompt_toolkit.completion import Completer, Completion
from prompt_toolkit.formatted_text import ANSI
from prompt_toolkit.styles import Style
from prompt_toolkit.key_binding import KeyBindings

if 'TMUX' in os.environ:
    sys.exit()

l = ["admiring", "adoring", "affectionate", "agitated", "amazing", "angry", "awesome",
     "blissful", "boring", "brave", "clever", "cocky", "compassionate", "competent",
     "condescending", "confident", "cranky", "dazzling", "determined", "distracted",
     "dreamy", "eager", "ecstatic", "elastic", "elated", "elegant", "eloquent", "epic", "fervent",
     "festive", "flamboyant", "focused", "friendly", "frosty", "gallant", "gifted", "goofy",
     "gracious", "happy", "hardcore", "heuristic", "hopeful", "hungry", "infallible",
     "inspiring", "jolly", "jovial", "keen", "kind", "laughing", "loving", "lucid", "mystifying",
     "modest", "musing", "naughty", "nervous", "nifty", "nostalgic", "objective", "optimistic",
     "peaceful", "pedantic", "pensive", "practical", "priceless", "quirky", "quizzical",
     "relaxed", "reverent", "romantic", "sad", "serene", "sharp", "silly", "sleepy", "stoic",
     "stupefied", "suspicious", "tender", "thirsty", "trusting", "unruffled", "upbeat",
     "vibrant", "vigilant", "vigorous", "wizardly", "wonderful", "xenodochial", "youthful",
     "zealous", "zen"]

r = ["albattani", "allen", "almeida", "agnesi", "archimedes", "ardinghelli", "aryabhata",
     "austin", "babbage", "banach", "bardeen", "bartik", "bassi", "beaver", "bell", "benz",
     "bhabha", "bhaskara", "blackwell", "bohr", "booth", "borg", "bose", "boyd", "brahmagupta",
     "brattain", "brown", "carson", "chandrasekhar", "shannon", "clarke", "colden", "cori",
     "cray", "curran", "curie", "darwin", "davinci", "dijkstra", "dubinsky", "easley", "edison",
     "einstein", "elion", "engelbart", "euclid", "euler", "fermat", "fermi", "feynman",
     "franklin", "galileo", "gates", "goldberg", "goldstine", "goldwasser", "golick",
     "goodall", "haibt", "hamilton", "hawking", "heisenberg", "hermann", "heyrovsky",
     "hodgkin", "hoover", "hopper", "hugle", "hypatia", "jackson", "jang", "jennings", "jepsen",
     "johnson", "joliot", "jones", "kalam", "kare", "keller", "kepler", "khorana", "kilby", "kirch",
     "knuth", "kowalevski", "lalande", "lamarr", "lamport", "leakey", "leavitt", "lewin",
     "lichterman", "liskov", "lovelace", "lumière", "mahavira", "mayer", "mccarthy",
     "mcclintock", "mclean", "mcully", "meitner", "meninsky", "mestorf", "minsky",
     "mirzakhani", "morse", "murdock", "neumann", "newton", "nightingale", "nobel", "noether",
     "northcutt", "noyce", "panini", "pare", "pasteur", "payne", "perlman", "pike", "poincaré",
     "poitras", "ptolemy", "raman", "ramanujan", "ride", "montalcini", "ritchie", "roentgen",
     "rosalind", "saha", "sammet", "shaw", "shirley", "shockley", "sinoussi", "snyder", "spence",
     "stallman", "stonebraker", "swanson", "swartz", "swirles", "tesla", "thompson",
     "torvalds", "turing", "varahamihira", "visvesvaraya", "volhard", "wescoff", "wiles",
     "williams", "wilson", "wing", "wozniak", "wright", "yalow", "yonath"]

generated_name = f"{random.choice(l)}-{random.choice(r)}"

result = subprocess.run(["tmux", "list-sessions", "-F", "#S"], capture_output=True, text=True)
existing_sessions = result.stdout.splitlines()

available_options = existing_sessions + [generated_name, 'no-session']

class MyCompleter(Completer):
    def get_completions(self, document, complete_event):
        text = document.text_before_cursor
        for option in available_options:
            if option.startswith(text):
                yield Completion(option, start_position=-len(text), display=None)

completer = MyCompleter()

style = Style.from_dict({
    'completion-menu': 'bg:#073642 fg:#93a1a1',
    'completion-menu.completion': 'bg:#073642 fg:#93a1a1',
    'completion-menu.completion.current': 'bg:#586e75 fg:#93a1a1 bold',
})

kb = KeyBindings()

@kb.add('c-c')
def _(event):
    if not event.current_buffer.text:
        sys.exit()
    else:
        event.current_buffer.reset()

subprocess.run(["clear"])

def solarized_yellow(s):
    return f"\033[38;5;136m{s}\033[0m"

def solarized_orange(s):
    return f"\033[38;5;166m{s}\033[0m"

def solarized_blue(s):
    return f"\033[38;5;32m{s}\033[0m"

print(solarized_yellow(f"Ongoing sessions ({len(available_options) - 1}): \t"), end="")

for index, option in enumerate(available_options):
    if index > 0:
        print("\t\t\t", end="")
    print(solarized_orange(f"({index}) {option}"))

print()

default_choice = generated_name
if existing_sessions:
    default_choice = existing_sessions[0]

prompt_text = solarized_blue(f"Choose/name your session (default, {default_choice}): ")
choice = prompt(ANSI(prompt_text), completer=completer, style=style, key_bindings=kb).strip()

if choice == "no-session":
    sys.exit()
elif choice in available_options and choice != generated_name:
    subprocess.run(["tmux", "attach-session", "-t", choice])
else:
    if not choice or choice == default_choice:
        choice = default_choice
    if choice in existing_sessions:
        subprocess.run(["tmux", "attach-session", "-t", choice])
    else:
        subprocess.run(["tmux", "new", "-s", choice])
