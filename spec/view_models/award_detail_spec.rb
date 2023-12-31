require 'spec_helper'


describe AwardDetail do
  let(:issue) { double(Issue, title: 'title', id: 1, friendly_id: 'fid') }
  let(:award) { double(Award, title: 'title', id: 1, friendly_id: 'eafid', body: double(MarkdownContent, content: "Body"), cover_image: double(Image, url:  'url')) }
  let(:essay) { double(Essay, id: 1, title: 'essay')}

  subject { described_class.new(issue, award)}



  describe 'build' do
    before(:each) do
      @controller = double(ApplicationController, params: ActionController::Parameters.new(issue_id: issue.friendly_id, id: award.friendly_id ))
      AwardQuery.stub(:find).with(award.friendly_id).and_return(award)
      IssueQuery.stub(:find).with(issue.friendly_id)
    end

    subject { described_class }

    it "builds from the url slug" do
      expect { subject.build(@controller) }.to_not raise_error
    end

    it "passes the essay into the object" do
      expect(subject.build(@controller).award).to eq(award)
    end

  end


  describe "#link_to_essay" do
    it "calls the essay link render" do
      expect(EssayLink).to receive(:render).with(essay, false)
      subject.link_to_essay(essay)
    end
  end


  describe "#has_essays?" do
    it "is true when the award has essays" do
      subject.stub(:essays).and_return([essay])
      expect(subject.has_essays?).to be_truthy
    end

    it "returns false when the award does not have essays" do
      subject.stub(:essays).and_return([])
      expect(subject.has_essays?).to be_falsey
    end
  end


  describe "#essays" do
    it "calls essays the correct essay query" do
      expect(EssayQuery).to receive(:published_essays_for_issue_and_award).with(issue.friendly_id, award)
      subject.essays
    end
  end


  describe "#body" do
    it "references the markdown object" do
      expect(award.body).to respond_to(:content)
    end
  end
end
