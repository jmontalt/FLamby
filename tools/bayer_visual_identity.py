from dataclasses import dataclass
from enum import Enum

import plotly.graph_objects as go
import plotly.io as pio


class Tone(Enum):
    BLUE = 0
    GREEN = 1
    PURPLE = 2


class Hue(Enum):
    BRIGHT = 0
    CORE = 1
    MID = 2
    DARK = 3


@dataclass
class ColorDescriptor:
    name: str
    tone: Tone
    hue: Hue
    hex: str


_BAYER_COLORS = [
    ColorDescriptor(name="Bayer Bright Blue", tone=Tone.BLUE, hue=Hue.BRIGHT, hex="#00BCFF"),
    ColorDescriptor(name="Bayer Bright Green", tone=Tone.GREEN, hue=Hue.BRIGHT, hex="#89D329"),
    ColorDescriptor(name="Bayer Fuchsia", tone=Tone.PURPLE, hue=Hue.BRIGHT, hex="#FF3162"),
    ColorDescriptor(name="Bayer Blue", tone=Tone.BLUE, hue=Hue.CORE, hex="#0091DF"),
    ColorDescriptor(name="Bayer Green", tone=Tone.GREEN, hue=Hue.CORE, hex="#66B512"),
    ColorDescriptor(name="Bayer Raspberry", tone=Tone.PURPLE, hue=Hue.CORE, hex="#D30F4B"),
    ColorDescriptor(name="Bayer Mid Blue", tone=Tone.BLUE, hue=Hue.MID, hex="#00617F"),
    ColorDescriptor(name="Bayer Mid Green", tone=Tone.GREEN, hue=Hue.MID, hex="#2B6636"),
    ColorDescriptor(name="Bayer Mid Purple", tone=Tone.PURPLE, hue=Hue.MID, hex="#624963"),
    ColorDescriptor(name="Bayer Dark Blue", tone=Tone.BLUE, hue=Hue.DARK, hex="#10384F"),
    ColorDescriptor(name="Bayer Dark Green", tone=Tone.GREEN, hue=Hue.DARK, hex="#004422"),
    ColorDescriptor(name="Bayer Dark Purple", tone=Tone.PURPLE, hue=Hue.DARK, hex="#004422"),
]


def get_bayer_color_by_name(name):
    for color in _BAYER_COLORS:
        if color.name.lower() == name.lower():
            return color
    raise ValueError(f"No color with name: {name}")


def get_bayer_color_by_tone_and_hue(tone, hue):
    for color in _BAYER_COLORS:
        if color.tone == tone and color.hue == hue:
            return color
    raise ValueError(f"No color with tone {tone} and hue {hue}")


def set_bayer_theme():
    pio.templates.default = go.layout.Template(
        layout=go.Layout(
            font=dict(family="Arial", color=get_bayer_color_by_name("Bayer Dark Blue").hex),
            colorway=list(
                map(
                    lambda name: get_bayer_color_by_name(name).hex,
                    [
                        "Bayer Bright Blue",
                        "Bayer Bright Green",
                        "Bayer Fuchsia",
                        "Bayer Mid Blue",
                        "Bayer Mid Green",
                        "Bayer Mid Purple",
                    ],
                )
            ),
        )
    )
