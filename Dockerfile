# 19.01.20現在最新安定版のイメージを取得
FROM ruby:2.5.3

# railsコンソール中で日本語入力するための設定
ENV LANG C.UTF-8

# 必要なパッケージのインストール
# /var/lib/apt/lists配下のキャッシュを削除し、容量を小さくする
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs \
    && rm -rf /var/lib/apt/lists/*          

# 作業ディレクトリの作成、設定
RUN mkdir /app_name 
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# Gemfileのbundle install
RUN bundle install