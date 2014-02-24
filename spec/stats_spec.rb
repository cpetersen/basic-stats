require 'spec_helper'

describe Basic::Stats do
  let(:short_array) { [1,2,3].extend Basic::Stats }
  let(:array) { [1,2,3,4,5,6,7,8,9,10].extend Basic::Stats }
  let(:array_with_outlier) { [1,2,3,4,5,6,7,8,9,30].extend Basic::Stats }

  it "should have a mean of 5.5" do
    array.mean.should == 5.5
  end

  it "should have a mean of 5.5" do
    array.median.should == 5.5
  end

  it "should have a mean of 5.5" do
    array_with_outlier.median.should == 5.5
  end

  it "should have a mean of 2" do
    short_array.median.should == 2
  end

  it "should have a standard deviation of 3.02765..." do
    array.standard_deviation.should == 3.0276503540974917
  end

  it "should have a sample variance of 9.1666..." do
    array.sample_variance.should == 9.166666666666666
  end

  it "should have a critical z of 2.29" do
    array.critical_z.should == 2.29
  end

  it "should reject an outlier (copy)" do
    new_array = array_with_outlier.reject_outliers
    new_array.size.should == (array_with_outlier.size-1)
  end

  it "should reject an outlier (mutate)" do
    expect {
      array_with_outlier.reject_outliers!
    }.to change{array_with_outlier.size}.by(-1)
  end

  it "should select outliers" do
    outliers = array_with_outlier.select_outliers
    outliers.should == [30]
  end

  describe "z" do
    it "of 3 should be 0.82572" do
      array.z(3).should == 0.8257228238447705
    end

    it "of 10 should be 1.48630" do
      array.z(10).should == 1.4863010829205867
    end
  end

  describe "critical z" do
    it "of 0 should be nil" do
      Basic::Stats.critical_z(0).should be_nil
    end

    it "of 1 should be nil" do
      Basic::Stats.critical_z(1).should be_nil
    end

    it "of 3 should be 1.15" do
      Basic::Stats.critical_z(3).should == 1.15
    end

    it "of 20 should be 2.71" do
      Basic::Stats.critical_z(20).should == 2.71
    end

    it "of 45 should be 3.04" do
      Basic::Stats.critical_z(45).should == 3.04
    end

    it "of 200 should be 3.49" do
      Basic::Stats.critical_z(200).should == 3.49
    end
  end
end
