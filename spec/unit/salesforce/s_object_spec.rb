require 'spec_helper'

describe Salesforce::SObject do

  let(:klass) { Account }

  describe '.type' do

    specify { Account.type.should == 'sfAccount'}

  end

  describe '.object_url' do

    context 'given an id' do
      let(:service_url) { "http://service.url" }

      specify do
        Salesforce.configuration.stub(:service_url){ service_url }
        result_url = service_url+"/sobjects/#{Account.type}/123"

        Account.send(:object_url, '123').should == result_url
      end

    end

  end

  describe '.where' do

    context 'given a valid id' do

      it 'finds an sobject' do
        pending
        klass.where(:id => '123').should include(klass)
      end

    end

  end

end