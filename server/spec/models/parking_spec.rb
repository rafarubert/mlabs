require 'spec_helper'

RSpec.describe Parking, type: :model do

  it "use parking table" do
    expect( subject.class.table_name ).to eq 'parking'
  end

  it { is_expected.to validate_presence_of( :plate )  }
end