class DefaultDrugList < ActiveRecord::Base
	DRUGS = ['paracetamol', 'calpol', 'crocin', 'moxikind', 'meftal', 'carmicide'].freeze
	DOSAGE = ['mg','ml']
	TIMING = ['1 time', '2 times', '3 times', '4 times']

end
