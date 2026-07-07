# 파비콘 추가 프롬프트

## 개요
HTML 문서에 SVG 형식의 파비콘을 추가하는 프롬프트입니다.

## 프롬프트
> @index.html 문서에 @favicon.svg를 파비콘으로 넣어줘

## 적용 코드
```html
<link rel="icon" href="favicon.svg" type="image/svg+xml">
```

## 참고 사항
- SVG 파일을 파비콘으로 사용할 때는 `type="image/svg+xml"` 속성을 지정하는 것이 좋습니다.
- 파일 경로가 루트 디렉토리가 아닐 경우 경로를 수정하여 사용합니다.
