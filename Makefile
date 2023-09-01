DATA_PATH = /home/amorvan/dev/edf_precourlis/PreCourlis/test/data

export PYTHONPATH = ${PWD}:${PWD}/.venv/lib/python3.10/site-packages

install:
	python3 -m venv .venv
	.venv/bin/pip install --no-deps https://github.com/CNR-Engineering/PyTelTools/archive/master.tar.gz#egg=PyTelTools
	.venv/bin/pip install --no-deps https://github.com/CNR-Engineering/Crue10_tools/archive/master.tar.gz#egg=Crue10_tools
	.venv/bin/pip install \
		coloredlogs \
		"pyshp>=2.0"

clean:
	rm -rf .venv

help:
	cli/densify_cross_sections.py --help

test:
	cli/densify_cross_sections.py -v \
		--long_step 100 \
		--lat_step 5 \
		--attr_cross_sections sec_name \
		$(DATA_PATH)/cas1/axeHydroBief1.shp \
		$(DATA_PATH)/profiles.shp \
		$(DATA_PATH)/expected/interpolated_profiles.georefC

		#--infile_lignes_contraintes /$(DATA_PATH)/cas1/contraintes.shp \
