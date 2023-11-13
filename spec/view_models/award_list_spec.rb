require 'spec_helper'

describe AwardList do
  let(:issue) { double(Issue, title: 'title', id: 1, friendly_id: 'fid') }
  let(:awards) { [] }

  subject { described_class.new(issue, awards)}


  it 'responds to #each' do
    expect(subject).to respond_to(:each)
  end


  describe 'build' do
    before(:each) do
      @controller = double(ApplicationController, params: ActionController::Parameters.new(id: issue.friendly_id ))
      IssueQuery.stub(:find).with(issue.friendly_id)
      AwardQuery.stub(:all).and_return(awards)
    end

    subject { described_class }

    it "builds from the url slug" do
      expect { subject.build(@controller) }.to_not raise_error
    end

  end

  describe "#render_issue_header" do
    it "calls the issue header " do
      expect(IssueHeader).to receive(:render).with(issue, false)
      subject.render_issue_header
    end
  end
end
