#!/usr/bin/env python

import os
from sh import convert

images = dict(wait="Please Wait...",
              nocart="No Cartridge!",
              )
for filename, text in images.iteritems():
    convert("-size", '640x480',
            'xc:black',
            '-fill', 'white',
            '-stroke', 'black',
            '-font', 'Nimbus-Mono-Bold',
            '-pointsize', '70',
            '-gravity', 'center',
            '-draw', 'text 0,0 "{}"'.format(text),
            '-scale', '20%',
            '-scale', '640x480!',
            'images/'+filename+".png")
