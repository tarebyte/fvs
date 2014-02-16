require 'spec_helpers'

describe PostPolicy do

  subject { PostPolicy.new(user, post) }

  let(:post) { FactoryGirl.create(:post) }

  context "for a visitor" do
    let(:user) { nil }


    permissions :index? do
      it "does not allow them to see a post if it is flagged" do
        before { post.flagged = true }

      end

    end

    it { should_not permit(:create)  }
    it { should_not permit(:new)     }
    it { should_not permit(:edit)    }
    it { should_not permit(:update)  }
    it { should_not permit(:destroy) }
  end

  context "for a normal user" do
    let(:user) { FactoryGirl.create(:user) }

    it { should permit(:index) }
    it { should permit(:show)  }

    permissions :create? do
      it "allows them to create a post if they are a user" do
        expect(subject).to permit(user, Post.new)
      end
    end

    permissions :update? do
      it "allows a user to update only if they created the post" do
        expect(subject).to permit(user, Post.update_attributes)
      end

      it "allows a user to update if they are an admin" do
        before { user.admin = true }
        expect(subject).to permit(user, Post.update_attributes)
      end
    end
  end
end
