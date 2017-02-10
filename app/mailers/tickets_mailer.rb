class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket

    mail(to: user.email, subject: 'Вы купили билет на сайте Tutu')
  end

  def refund_ticket(user, ticket)
    @user = user
    @ticket = ticket
    
    mail(to: user.email, subject: 'Вы вернули билет на сайте Tutu')
  end
end
