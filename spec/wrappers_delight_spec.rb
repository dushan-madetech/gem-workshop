#!/usr/bin/env ruby
require_relative '../lib/wrappers/delight.rb'

describe Wrappers::Delight::WordWrap do
	it "should return an empty string when given an empty string" do
	  expect(subject.wrap("",0)).to eq("")
	end

	it "should return the string if it is less than the wrap length" do
	  expect(subject.wrap("test",6)).to eq("test")
	end

	it "should wrap the word onto a new line if it is longer than the length" do
	  expect(subject.wrap("testing",4)).to eq("test\ning")
	end

	it "should wrap a word multiple times if necessary due to wrap length" do
	  expect(subject.wrap("testing",3)).to eq("tes\ntin\ng")
	end

	it "should wrap on the word boundary (i.e. prefer spaces)" do
	  expect(subject.wrap("test test",5)).to eq("test\ntest")
	end

	it "should wrap after the word boundary (i.e. prefer spaces instead of splitting word)" do
	  expect(subject.wrap("test test",6)).to eq("test\ntest")
	end

	it "should wrap just before a word boundary (i.e. prefer spaces for wrapping)" do
	  expect(subject.wrap("test test",4)).to eq("test\ntest")
	end
end
