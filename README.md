Legal Entity Reference Data
===========================

This project aims to enrich data from the [opencorporates][1] database,
namely entities with issued capital, by referential information.  This
includes tracking issued equity and debt alongside principals like the
company's mission statement, its website, etc.

This repository also contains domain specific ontologies and auxiliary
datasets and source code to facilitate merging with our primary sources
([openleis][3] and [Bloomberg open symbology][4]).

All data is released under [CC BY-SA 4.0][3].
All source code is released under [BSD3][5].


jurisdictions.ttl
-----------------

Named individuals to address federal/national jurisdictions.
This dataset is mostly auto-generated from openleis' Jurisdiction fields
and dbpedia's ISO 3166-2 resources.


legal_forms.ttl
---------------

Canonicalisation of openleis-derived legal forms (types of organisations).
This dataset is a hand-crafted mapping between openleis' LegalForm fields
and wikipedia/dbpedia resources.


  [1]: https://opencorporates.com/
  [2]: http://creativecommons.org/licenses/by-sa/4.0/
  [3]: http://openleis.com/
  [4]: http://bsym.bloomberg.com/sym/
  [5]: http://opensource.org/licenses/BSD-3-Clause
