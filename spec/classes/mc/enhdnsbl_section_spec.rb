require 'spec_helper'

describe 'sendmail::mc::enhdnsbl_section' do
  let(:pre_condition) {
    'include sendmail::service'
  }

  context 'with no arguments' do
    it {
      should contain_class('sendmail::makeall')

      should contain_concat__fragment('sendmail_mc-enhdnsbl_header') \
              .with_content(/^dnl # DNS Blacklists$/) \
              .with_order('50') \
              .that_notifies('Class[sendmail::makeall]')
    }
  end
end
