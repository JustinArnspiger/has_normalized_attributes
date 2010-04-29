require File.dirname(__FILE__) + '/base'

describe Sample do
  before(:each) do
    @sample = Sample.new
  end

  describe "Zipcode" do
    it{@sample.value = "12 345";@sample.value.normalize(Normalizations::ZipCode).should == "12345"}
    it{@sample.value = "12.345";@sample.value.normalize(Normalizations::ZipCode).should == "12345"}
    it{@sample.value = "12-345";@sample.value.normalize(Normalizations::ZipCode).should == "12345"}
    it{@sample.value = "1,2345";@sample.value.normalize(Normalizations::ZipCode).should == "12345"}
  end

  describe "Phone" do
    it{@sample.value = "12-345";@sample.value.normalize(Normalizations::Phone).should == "12345"}
    it{@sample.value = "12.345";@sample.value.normalize(Normalizations::Phone).should == "12345"}
    it{@sample.value = "1-2345";@sample.value.normalize(Normalizations::Phone).should == "12345"}
    it{@sample.value = "1,2345";@sample.value.normalize(Normalizations::Phone).should == "12345"}
  end

  describe "Ssn" do
    it{@sample.value = "12-345";@sample.value.normalize(Normalizations::Ssn).should == "12345"}
    it{@sample.value = "12.345";@sample.value.normalize(Normalizations::Ssn).should == "12345"}
    it{@sample.value = "1-2345";@sample.value.normalize(Normalizations::Ssn).should == "12345"}
    it{@sample.value = "1,2345";@sample.value.normalize(Normalizations::Ssn).should == "12345"}
  end

  describe "TaxID" do
    it{@sample.value = "12-345";@sample.value.normalize(Normalizations::TaxID).should == "12345"}
    it{@sample.value = "12.345";@sample.value.normalize(Normalizations::TaxID).should == "12345"}
    it{@sample.value = "1-2345";@sample.value.normalize(Normalizations::TaxID).should == "12345"}
    it{@sample.value = "1,2345";@sample.value.normalize(Normalizations::TaxID).should == "12345"}
  end

  describe "Dollar" do
    it{@sample.value = "$1";@sample.value.normalize(Normalizations::Dollar).should == "1"}
  end

  describe "Number" do
    it{@sample.value = "1,23";@sample.value.normalize(Normalizations::Number).should == "123"}
  end

  describe "Percent" do
    it{@sample.value = "%50";@sample.value.normalize(Normalizations::Percent).should == "50"}
  end

  describe "Spaces" do
    it{@sample.value = "5 0";@sample.value.normalize(Normalizations::Spaces).should == "50"}
  end


end

