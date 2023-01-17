# Final Project Infra as code
Final Project때 담당하였던 사내 Monolithic 서버를 인프라 코드로 작성하여 관리한 리포지토리

![image](https://user-images.githubusercontent.com/87401709/194770046-5d692713-eb83-4801-9a03-be18aa25faac.png)

현재 Repo는 API Gateway부터 JWT 인증 서버까지 구현이 되어 있으며, API 서버 부분은 구현되어 있지 않음.
또한 EC2 내의 서버 데이터를 초기화 할 방법을 찾지 못하여 볼륨 이미지를 통해 관리하였기 때문에 위 코드들을 통해 생성하여도 DB와 EC2서버는 작동하지 않음.
