import sys

comp_lookup = {
    '0'     : '0101010',
    '1'     : '0111111',
    '-1'    : '0111010',
    'D'     : '0001100',
    'A'     : '0110000',
    'M'     : '1110000',
    '!D'    : '0001101',
    '!A'    : '0110001',
    '!M'    : '1110001',
    '-D'    : '0001111',
    '-A'    : '0110011',
    '-M'    : '1110011',
    'D+1'   : '0011111',
    'A+1'   : '0110111',
    'M+1'   : '0110111',
    'D-1'   : '0001110',
    'A-1'   : '0110010',
    'M-1'   : '1110010',
    'D+A'   : '0000010',
    'D+M'   : '1000010',
    'D-A'   : '0010011',
    'D-M'   : '1010011',
    'A-D'   : '0000111',
    'M-D'   : '1000111',
    'D&A'   : '0000000',
    'D&M'   : '1000000',
    'D|A'   : '0010101',
    'D|M'   : '1010101'
}


def parse_A_command(command):
    command_length = 16
    binary_command = ''
    value = int(command[1:])
    address = bin(value)[2:]
    for index in range(command_length - len(address)):
        binary_command += '0'
    binary_command += address

    return binary_command

def parse_C_command(command):
    binary_command = '111'
    a_bin = '1'
    c_bins = '1'

    binary_command += (a_bin + c_bins)
    return 'C_COMMAND' + binary_command

def parse_C_comp(command):
    binary_comp = command
    return binary_comp

def parse_command(command):
    is_comment = command[:2] == '//'
    is_A_command = command[:1] == '@'
    is_L_command = command[:1] == '('
    is_C_command = command.find('=') != -1
    if is_comment:
        return ''
    elif is_A_command:
        return parse_A_command(command)
    elif is_L_command:
        return 'L_COMMAND'
    elif is_C_command: 
        return parse_C_command(command)
    else: 
        return ''

def parse(input_string):
    output_string = ''
    delimiter = '\n'
    split_file = input_string.split(delimiter)
    for index, line in enumerate(split_file):
        binary = parse_command(line)
        output_string += (binary + ' ' + line + '\n')

    return output_string