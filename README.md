# tfwkdemo
*issue date : 2022.08.12
*terraform workspace demo + multi environment test

1. backend용 스토리지를 먼저 생성한다. 루트에 있는 main_backend.tf를 개별로 실행한다.
   terraform workspace = default 인 상태에서 생성
   terraform init
   terraform apply

2. terraform workspace 를 Dev 와 Prd 라는 이름으로 생성하여, 각각의 환경에서 terraform 배포를 진행한다.

3. 모듈은 테스트 목적으로 vnet 과 storage를 생성하는 것으로 한다.
   input 변수는 variable.tf 에 등록하여 이 이름을 루트 모듈에서도 사용한다.
   output 변수는 outputs.tf 에 등록하여 모듈간 제공되는 변수로 사용한다.

4. 개발환경의 배포
  1) /infra/env/dev 폴더로 이동하여 배포작업실시
  2) /infra/env/dev/terraform init
  3) terraform workspace new Dev (고의로 대문자로 Dev 생성)
  4) terraform validate  로 구문이상 체크
  5) terraform plan -out tfplan_dev
  6) terraform apply --auto-approve
  7) Azure Portal에서 생성된 리소스 확인한다

 5. 운영환경의 배포
  1) /infra/env/prd 폴더로 이동하여 배포작업실시
  2) /infra/env/prd/terraform init
  3) terraform workspace new Prd (고의로 대문자로 Dev 생성)
  4) terraform validate  로 구문이상 체크
  5) terraform plan -out tfplan_prd
  6) terraform apply --auto-approve
  7) Azure Portal에서 생성된 리소스 확인한다 


9. vscode 와 github 연동 관련 : https://webnautes.tistory.com/1422
Visual Studio Code에서 Github에 업로드하는 방법
개발 환경/Visual Studio Code / webnautes / 2022. 3. 17. 21:59
