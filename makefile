# Create a blank makefile and setup a default: task as shown in the lecture demo, so it just cats the makefile itself
default:
	@cat makefile

# Create a job called synthetic_data.csv, which should download (wget) the content, (not the html page), from https://gist.github.com/Niarfe/25100a860cbb660150a3fec87378d8ac
synthetic_data.csv:
	wget https://gist.githubusercontent.com/Niarfe/25100a860cbb660150a3fec87378d8ac/raw/b280768fc7ad782c65f0e714017af2f05ba88ef2/synthetic_data.csv

# Create a job named square_wave.png. (use the line above with the output file name and column 2)
square_wave.png:
	gnuplot -e "set datafile separator ','; set term png; set output 'square_wave.png'; plot 'synthetic_data.csv' using 1:2 with lines"

# Create a job named fibonachi.png. (use the line above with the output file name and column 3)
fibonachi.png:
	gnuplot -e "set datafile separator ','; set term png; set output 'fibonachi.png'; plot 'synthetic_data.csv' using 1:3 with lines"

# Create a job that removes the downloaded file and generated png files. This should return the code to a clean state
clean:
	rm synthetic_data.csv || true
	rm square_wave.png || true
	rm fibonachi.png || true
	ls -la

# Create a job that is a PHONY, which should generate both png files, call it all_images. The job itself should be in one line, so after the PHONY callout, it should read like all_images: <fill in this section>
.PHONY: all_images
all_images: square_wave.png fibonachi.png
