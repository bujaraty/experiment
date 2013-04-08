import argparse

argp = argparse.ArgumentParser(description="An application to predict how likely the given SNPs will have deleterious effect")
tmp_help=[]
tmp_help.append("A file with list of SNPs.")
tmp_help.append("It can be either in standard VCF format or CBV (CombiVEP) format.")
tmp_help.append("CBV format consists of five fields: CHROM, POS, REF, ALT, ACTUAL_DELETERIOUS_EFFECT.")
tmp_help.append("Each field is separated by tab.")
tmp_help.append("SNP Position(POS) is 1-based index.")
argp.add_argument('input_file', help=' '.join(tmp_help))
argp.add_argument('-f', '--input_format', help='Input format', choices=['addffd', 'dfadf'])
argp.parse_args()





