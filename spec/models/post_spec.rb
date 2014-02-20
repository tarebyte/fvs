require 'spec_helper'

describe Post do

  before do
    @post = create(:post)
  end

  subject { @post }

  it { should respond_to(:content) }
  it { should respond_to(:title)   }
  it { should respond_to(:author)  }
  it { should respond_to(:flagged?) }

  it { should be_valid }

  describe "when title is not present" do
    before { @post.title = " " }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @post.content = " " }
    it { should_not be_valid }
  end

  describe "when there isn't an author present" do
    before { @post.author_id = nil }
    it { should_not be_valid }
  end
end
