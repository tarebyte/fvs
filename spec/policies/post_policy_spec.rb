require 'spec_helper'

describe PostPolicy do
  let(:user) { create(:user) }
  let(:post) { create(:post) }
  subject { PostPolicy }

  # context 'unregistered user' do
  #   it { should permit(post, :index)   }
  # end
  #
  # context "an unregistered user" do
  #
    # it { should     permit(:show)   }
    #
    # it { should_not permit(:create)  }
    # it { should_not permit(:new)     }
    # it { should_not permit(:edit)    }
    # it { should_not permit(:update)  }
    # it { should_not permit(:destroy) }
  # end

  # context "for a normal user" do
  #   let(:user) { FactoryGirl.create(:user) }
  #
  #   it { should permit(:index) }
  #   it { should permit(:show)  }
  #
  #   permissions :create? do
  #     it "allows them to create a post if they are a user" do
  #       expect(subject).to permit(user, Post.new)
  #     end
  #   end
  #
  #   permissions :update? do
  #     it "allows a user to update only if they created the post" do
  #       expect(subject).to permit(user, Post.update_attributes)
  #     end
  #
  #     it "allows a user to update if they are an admin" do
  #       # before { user.admin = true }
  #       expect(subject).to permit(user, Post.update_attributes)
  #     end
  #   end
  # end
end
