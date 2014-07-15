# rubocop:disable all

FactoryGirl.define do
  factory :email, class: Hash do
    message_id   '53b72e84f0168_40cf80865be8313df@admins-mbp-2.mail'
    date_raw     'Sat, 05 Jul 2014 14:45:25 +0200'
    date         { DateTime.parse(date_raw) }

    from         ['sender@example.com']
    to           ['jane.doe@example.com']
    subject      'Meaning Of Life'
    links        ['http://a.com', 'http://b.com']

    mime_type    'text/html'
    charset      'UTF-8'
    content_type { "#{mime_type}; charset=#{charset}" }


    body {
      %Q(
<p>You will never be happy if you continue to search for what happiness</p>

<p>

 consists of. You will never live if you are looking for the meaning of life.</p>

<p>
 (Albert Camus)</p>

<p>Please, visit our websites: <a href=\"#{links[0]}\">A</a> or <a href=\"#{links[1]}\">B</a>.</p>
      ).strip
    }


    raw {
      %Q(
Date: #{date_raw}
From: #{from.join(', ')}
To: #{to.join(', ')}
Message-ID: <#{message_id}>
Subject: #{subject}
Mime-Version: 1.0
Content-Type: #{mime_type};
 charset=#{charset}
Content-Transfer-Encoding: 7bit

#{body}
      ).strip
    }

  end
end
