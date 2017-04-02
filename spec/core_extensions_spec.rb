require "spec_helper"
describe Array do

  context "#all_empty?" do
    it "returns true if all elements of the Array are empty" do
      expect(["",""].all_empty?).to be true
    end
    it "returns false if some of the Array elements are not empty" do
      expect(["","x"].all_empty?).to be false
    end
    it "returns true for an empty Array" do
      expect([].all_empty?).to be true
    end
  end

  context "#all_same?" do
    it "returns true if all elements of the Array are the same" do
      expect(["x","x","x"].all_same?).to be true
    end
    it "returns false if an element is different" do
      expect(["x","o","x"].all_same?).to be false
    end
    it "returns true for an empty Array" do
      expect([].all_same?).to be true
    end
  end

  context "#any_empty" do
    it "returns true if any element of an Array is empty" do
      expect(["x","","x"].any_empty?).to be true
    end
    it "returns false if all elements in an Array is full" do
      expect(["x","x","x"].any_empty?).to be false
    end
    it "returns false for an empty array" do
      expect([].any_empty?).to be false
    end
  end

  context "#all_full?" do
    it "returns true if Array is full" do
      expect(["x","o","x","o","x","o"].all_full?).to be true
    end
    it "returns false if Array is empty" do
      expect(["","",""].all_full?).to be false
    end
    it "returns" do
      expect([].all_full?).to be false
    end
  end

  context "#four_consecutive?" do
    it "returns true if Array includes 4 consecutive non unique elements" do
      expect(["","","x","x","x","x"].four_consecutive?).to be true
    end
    it "returns false if Array does not include 4 consecutive non unique elements" do
      expect(["","","x","","x","x"].four_consecutive?).to be false
    end
    it "returns false on an empty Array" do
      expect(["","",""].four_consecutive?).to be false
    end
  end

  context "#four_empty_elements_remaining?" do
    it "returns true if Array has 4 or more empty elements remaining" do
      expect(["","","","","x","x"].four_empty_elements_remaining?).to be true
    end
    it "returns false if Array has less than 4 empty elements remaining" do
      expect(["","","x","","x","x"].four_empty_elements_remaining?).to be false
    end
  end


end
