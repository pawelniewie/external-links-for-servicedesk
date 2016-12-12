describe ServiceButtonDecorator do
  let(:issue_payload) { JSON.parse(file_fixture('issue.json').read) }
  let(:service_button) { instance_double(ServiceButton) }
  let(:decorator) { ServiceButtonDecorator.new(service_button, context: {issue: issue_payload}) }

  context 'invalid custom field reference' do
    describe '#href' do
      before do
        expect(service_button).to receive(:href).and_return '{{customField "noSuchField"}}'
      end

      it 'should return empty string' do
        expect(decorator.href).to be ''
      end
    end

    describe '#label' do
      before do
        expect(service_button).to receive(:label).and_return '{{customField "noSuchField"}}'
      end

      it 'should return empty string' do
        expect(decorator.label).to be ''
      end
    end
  end

  context 'valid custom field reference' do
    describe '#href' do
      before do
        expect(service_button).to receive(:href).and_return '{{customField "Testing status"}}'
      end

      it 'should return empty string' do
        expect(decorator.href).to eq 'Not started'
      end
    end

    describe '#label' do
      before do
        expect(service_button).to receive(:label).and_return '{{customField "Testing status"}}'
      end

      it 'should return empty string' do
        expect(decorator.label).to eq 'Not started'
      end
    end
  end
end