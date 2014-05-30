import sys
from components import parser, code, symbol_table

to_read = sys.argv[1]
to_write = './test.hack'

def read_file():
    input_file = open(to_read, 'rU')
    input_file_string = input_file.read()
    input_file.close()
    return input_file_string

def write_new_file(output_string):
    output_file = open(to_write, 'w+')
    output_file.write(output_string)
    output_file.close()

def init():
    clean_string = read_file()
    parsed_string = parser.parse(clean_string)
    write_new_file(parsed_string)

if __name__ == "__main__":
    init()