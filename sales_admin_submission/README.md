# README

To run this application, make sure postgresql is running, and execute the following commands:

```bash
  git clone https://github.com/pindell-matt/challenges.git && cd challenges && cd sales_admin_submission
  bundle
  rake db:create && rake db:migrate
  rails s
```

And navigate to `http://localhost:3000` to see the running application

Click `choose file`, select `salesdata.csv` from `challenges/sales_admin`, and click `Import CSV`

Tests for this application can be run with:

```bash
  rspec
```
