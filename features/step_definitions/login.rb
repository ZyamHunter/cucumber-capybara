Dado('que esteja na página de login') do
    visit '/'
    page.find(:xpath, '//*[@testid="login_Logo"]', wait: 5)
end

Quando('preencher as credenciais corretamente') do
    page.find(:xpath, '//*[@testid="login_AdvancedInput_username"]', wait: 5).set 'bruno.cabral'
    page.find(:xpath, '//*[@testid="login_AdvancedInput_password"]', wait: 5).set 'Pass123123'
    page.find(:xpath, '//*[@testid="login_Button_Submit"]', wait: 5).click
end

Quando('confirmar o sms') do
    page.find(:xpath, '//*[@testid="request-sms_SmsCode_code"]', wait: 10).set '112233'
    page.find(:xpath, '//*[@testid="request-sms_SmsCode_Submit"]', wait: 10).click
end

Então('será logado no sistema') do
    page.find(:xpath, '//*[@testid="home_Logo"]', wait: 10)
end

Quando('preencher as credenciais incorretamente') do
    page.find(:xpath, '//*[@testid="login_AdvancedInput_username"]', wait: 5).set 'cucumber.capybara'
    page.find(:xpath, '//*[@testid="login_AdvancedInput_password"]', wait: 5).set 'pato.f1'
    page.find(:xpath, '//*[@testid="login_Button_Submit"]', wait: 5).click
end

Mas('não será encaminhado para a página de sms') do
    expect(page).to have_current_path('https://ibk.stg.bankeiro.inovanti.com.br/', url: true)
    page.find(:xpath, '//*[@testid="login_Logo"]', wait: 5)

    actual_url = current_url
    expected_url = 'https://ibk.stg.bankeiro.inovanti.com.br/'
    actual_url = current_url
  
    expect(actual_url).to eq(expected_url)
end

Quando('não será logado no sistema') do
    expect(page).not_to have_xpath('//*[@testid="home_Logo"]')
end