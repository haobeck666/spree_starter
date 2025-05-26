# config/initializers/csp.rb
Rails.application.config.content_security_policy do |policy|
  # 允许字体来源（包括 Google Fonts、阿里云、Stripe）
  policy.font_src :self, 'data:', 'https://fonts.gstatic.com', 'https://at.alicdn.com', 'https://m.stripe.network'
  
  # 允许样式来源（包括 Google Fonts、esm.sh）
  policy.style_src :self, 'unsafe-inline', 'https://fonts.googleapis.com', 'https://esm.sh'
  
  # 允许脚本来源（包括 Stripe 和内联脚本的哈希值）
  policy.script_src :self, 
                    'https://js.stripe.com', 
                    'https://m.stripe.network',
                    # 添加所有报错中的内联脚本哈希值
                    'sha256-Ki94Wu0S5B7ICT4+Wf20sQKfPpw3BwEXrUMhsO1SYBs=',
                    'sha256-UdPw4oKyeJMsUvyzbNNNn55BNOCSG/kYj2wpRpueb9M=',
                    'sha256-Bk2Ki1XPeMQgcV8U6q5OUXYdrX/47R4L1F0tatGpT7w=',
                    'sha256-cTEMn9hCLxCT6jqqPi6pdKYZNxMK7cZ4Cn5lUiqXBRQ=',
                    'sha256-nvy2GeEzINBOHXLEOHTXqHWVn/s+z3JAsJzn8a/GiFI='
  
  # 允许图片来源
  policy.img_src :self, :https, :data, :blob
  
  # 允许连接的 API（如 Stripe）
  policy.connect_src :self, 'https://api.stripe.com'
  
  # 允许 iframe（如 Stripe 支付组件）
  policy.frame_src :self, 'https://js.stripe.com'
  
  # 开发环境额外配置
  if Rails.env.development?
    policy.script_src :self, :https, 'unsafe-eval'  # 允许开发环境的 eval
    policy.connect_src :self, 'ws://localhost:3035'  # 允许 WebSocket 连接
  end
end

# 启用 CSP 报告模式（可选）
# Rails.application.config.content_security_policy_report_only = true
