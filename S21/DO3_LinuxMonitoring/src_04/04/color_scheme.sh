#!/bin/bash

if [ $back_head -eq 2 ]; then
	echo "Column 1 background = 2 (red)"
else 
	echo "Column 1 background = default (black)"
fi

if [ $font_head -eq 4 ]; then
        echo "Column 1 font color = 4 (blue)"
else 
        echo "Column 1 font color = default (purple)"
fi

if [ $back_value -eq 5 ]; then
        echo "Column 2 background = 5 (purple)"
else 
        echo "Column 2 background = default (black)"
fi

if [ $font_value -eq 1 ]; then
        echo "Column 2 font color = 1 (white)"
else 
        echo "Column 2 font color = default (green)"
fi

