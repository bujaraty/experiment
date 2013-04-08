from setuptools import setup, find_packages
#from distutils.core import setup

setup(
	name='MyTowel',
	version='0.1.0',
	author='test A. bc',
	author_email='tester@test.com',
	packages=['mytowel', 'mytowel.test'],
	scripts=['bin/test_bin.py'],
#    include_package_data = True,
#    package_data={'CombiVEP': ['combivep/data/CBV/*.cbv']
#                  },
    package_data={'CBV': ['data/CBV/*.cbv']},
	url='http://pypi.python.org/pypi/TowelStuff/',
	license='LICENSE.txt',
	description='Useful MyTowel stuff.',
	long_description=open('README.txt').read(),
	install_requires=[
	    "pyVCF >= 0.6.1",
	    ],
	)
