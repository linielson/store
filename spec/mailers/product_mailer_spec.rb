require 'rails_helper'

RSpec.describe ProductMailer, type: :mailer do
  describe 'in_stock' do
    let(:product) { create(:product, name: 'T-Shirt') }
    let(:subscriber) { create(:subscriber, email: 'david@example.org', product: product) }
    let(:mail) { ProductMailer.with(product: product, subscriber: subscriber).in_stock }

    it 'renders the headers' do
      expect(mail.subject).to eq('In stock')
      expect(mail.to).to eq(['david@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Good news!')
    end
  end
end