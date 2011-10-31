require 'spec_helper'

describe Salesforce::SObject do

  describe '#initialize' do

    context 'given salesforce like hash' do

      let(:attributes) do
        {
          "attributes"=>{"type"=>"Account", "url"=>"/services/data/v22.0/sobjects/Account/001U0000005cy3yIAA"},
          "Id"=>"001U0000005cy3yIAA", "Name"=>"Test1", "Website"=>"www.web.de", "OwnerId"=>"005U0000000IhuFIAS",
          "CreatedDate"=>"2011-10-27T14:45:41.000+0000", "CreatedById"=>"005U0000000IhuFIAS",
          "LastModifiedDate"=>"2011-10-27T14:45:41.000+0000", "LastModifiedById"=>"005U0000000IhuFIAS",
          "SystemModstamp"=>"2011-10-27T14:45:41.000+0000", "LastActivityDate"=>nil
        }
      end
      let(:account) { Account.new(attributes) }

      it 'sets id' do
        account.id.should == attributes['Id']
      end

    end

  end

  describe '.find' do

    let(:id) { '001U0000005cy3y' }
    let(:account) { Account.find(id) }

    context 'given a valid id' do

      it 'finds a sobject' do
        if ENV['SF_USERNAME']
          account.should be_a(Account)
        else
          pending 'ENV credentials missing.'
        end
      end

      it 'finds a sobject with correct id' do
        if ENV['SF_USERNAME']
          account.id.should == id
        else
          pending 'ENV credentials missing.'
        end
      end

    end

  end

end