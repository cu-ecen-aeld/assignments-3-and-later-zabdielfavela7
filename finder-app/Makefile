# Cross-compilation support
CC = $(CROSS_COMPILE)gcc

output: writer.c
	$(CC) writer.c -o writer
	@if [ "$(CC)" = "aarch64-none-linux-gnu-gcc" ]; then \
		mkdir -p ../assignments/assignment2; \
		file writer > ../assignments/assignment2/fileresult.txt; \
	fi

clean:
	rm -f *.o writer
