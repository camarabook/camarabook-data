.PHONY: no_targets__ help

help:
	sh -c "$(MAKE) -p no_targets__ | awk -F':' '/^[a-zA-Z0-9][^\$$#\/\\t=]*:([^=]|$$)/ {split(\$$1,A,/ /);for(i in A)print A[i]}' | grep -v '__\$$' | sort"

no_targets__:

camarabook-data:
	go build

all: deputies
	echo "Finished"
	make clean

deputies: deputies_from_search deputies_from_xml deputies_about

deputies_from_search: camarabook-data
	./camarabook-data --save-deputies-from-search

deputies_from_xml: camarabook-data
	./camarabook-data --save-deputies-from-xml

deputies_about: camarabook-data
	./camarabook-data --save-deputies-about

deputies_quotas: camarabook-data
	./camarabook-data --save-deputies-quotas

clean:
	rm -Rf ./camarabook-data

