require 'spec_helper'

RSpec.describe Parking, type: :model do
  it 'use parking table' do
    expect( subject.class.table_name ).to eq 'parking'
  end

  context 'Database structure' do
    it { is_expected.to have_db_column( :plate ).of_type( :string ) }
    it { is_expected.to have_db_column( :paid ).of_type( :boolean ) }
    it { is_expected.to have_db_column( :left ).of_type( :boolean ) }
    it { is_expected.to have_db_column( :created_at ).of_type( :datetime ) }
  end

  it { is_expected.to validate_presence_of( :plate )  }

  context 'Plate Format' do
    it { is_expected.to allow_value('AAA-9999').for( :plate ) }
    it { is_expected.to allow_value('ABC-1234').for( :plate ) }
    it { is_expected.not_to allow_value('A-1').for( :plate ) } 
    it { is_expected.not_to allow_value('123-AAAA').for( :plate ) } 
    it { is_expected.not_to allow_value('A1A-1234').for( :plate ) } 
    it { is_expected.not_to allow_value('AAA-A234').for( :plate ) } 
    it { is_expected.not_to allow_value('AAA-12345').for( :plate ) } 
    it { is_expected.not_to allow_value('AAAA-1234').for( :plate ) } 
    it { is_expected.not_to allow_value('AAAC-12345').for( :plate ) } 
  end

  context 'left only paid' do
    before{
      subject.plate = 'AAA-9999'
    }
 
    it 'not allow to leave if not paid' do
      subject.save

      subject.valid?

      expect(
        subject.errors[:left]
      ).to include 'permited only after paid'
  
    end

    it 'allow leave if paid' do
      subject.save

      subject.paid = true

      expect( subject.valid? ).to eq true
    end
  end

  it "show time without left" do
    allow( Time ).to receive(:now).and_return(
      Time.parse("2019-09-27 09:40:13")
    )
    subject.plate = 'AAA-9999'
    subject.save

    allow( Time ).to receive(:now).and_return(
      Time.parse("2019-09-27 09:40:13") + 25.minute
    )

    expect( subject.time ).to eq '25 minutes'

  end

  it "show time with left" do
    allow( Time ).to receive(:now).and_return(
      Time.parse("2019-09-27 09:40:13")
    )

    subject.plate = 'AAA-9999'
    subject.paid = 'true'
    subject.save

    allow( Time ).to receive(:now).and_return(
      Time.parse("2019-09-27 09:40:13") + 1.hour
    )

    subject.update(left: true)

    expect( subject.time ).to eq 'about 1 hour'

  end
  
end