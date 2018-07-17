foreman:
  server:
    enabled: true
    domain: domain.com
    fqdn: foreman.domain.com
    database:
      engine: 'postgresql'
      host: '127.0.0.1'
      name: 'foreman'
      password: 'password'
      user: 'foreman'
    mail:
      host: mail.domain.com
      password: passwd
      user: robot@domain.com
      domain: domain.com