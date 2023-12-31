require 'spec_helper'

describe EssayStyleDetail do
  let(:issue) { FactoryBot.create(:issue) }
  let(:essay_style) { FactoryBot.create(:essay_style) }
  let(:essay) { FactoryBot.create(:essay, issue: issue, essay_style: essay_style) }
  let(:controller) { double(ApplicationController, params: ActionController::Parameters.new(issue_id: issue.friendly_id, id: essay_style.friendly_id)) }

  subject { described_class.build(controller) }

  describe '#title' do
    it 'is the style title' do
      expect(subject.title).to be == essay_style.title
    end
  end

  describe '#year' do
    it 'is the year of the issue' do
      expect(subject.year).to be == issue.year
    end
  end

  describe '#link_to_show' do
    it 'links to the style show page' do
      expect(subject.link_to_show).to match "/volumes/#{issue.friendly_id}/style/#{essay_style.friendly_id}"
    end
  end


  describe '#link_to_issue' do
    it 'links to the issue path' do
      expect(subject.link_to_issue).to match "/volumes/#{issue.friendly_id}"
    end
  end

  describe '#link_to_essay' do
    it 'links to the essay path' do
      expect(subject.link_to_essay(essay)).to match "/essays/#{essay.friendly_id}"
    end
  end

  describe '#highlighted_essay' do
    it 'returns a HighlightedEssayDetail' do
      expect(subject.highlighted_essay).to be_a_kind_of(HighlightedEssayDetail)
    end
  end


  describe '#render_issue_header' do
    it "calls the issue header with the small version" do
      expect(IssueHeader).to receive(:render).with(issue, true)
      subject.render_issue_header
    end
  end


  describe 'essays' do
    it "calls the query" do
      expect(EssayQuery).to receive(:published_essays_for_issue_and_essay_style).with(issue, essay_style)
      subject.essays
    end
  end


  describe "#has_essays?" do

    it "returns true if the style has essays" do
      subject.stub(:essays).and_return([ double(Essay) ])
      expect(subject.has_essays?).to be_truthy
    end

    it "returns false if the style does not" do
      subject.stub(:essays).and_return([ ])
      expect(subject.has_essays?).to be_falsey
    end
  end

  describe '#render_highlighted_essay' do
    it 'renders the partial' do
      FactoryBot.create(:highlighted_essay, essay: essay, issue: issue, essay_style: essay_style)
      expect(subject).to receive(:render_to_string).with("essay_styles/highlighted_essay", highlighted_essay_detail: subject.highlighted_essay)
      subject.render_highlighted_essay
    end

    it 'renders nothing if there is no highlighted essay' do
      expect(subject).to_not receive(:render_to_string)
      subject.render_highlighted_essay
    end
  end
end
