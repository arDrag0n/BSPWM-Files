#!/bin/env python3
from os import popen
key = "something"
output = popen("playerctl --player=spotify play").read()
while key != "q":
    if output == "":
        key = "q"
    if "No player" in output:
        popen("playerctl --player=spotify play")
