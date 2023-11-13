module SolrStubs
  def add_solr_stubs
    allow_any_instance_of(Essay).to receive(:perform_index_tasks).and_return(true)
    allow_any_instance_of(Essay).to receive(:remove_from_index)
  end
end
