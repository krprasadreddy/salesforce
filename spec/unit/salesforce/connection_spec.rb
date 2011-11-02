require 'spec_helper'

describe Salesforce::Connection do

  let(:klass) { Account }

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

end
