# 앙상블 기법 면접 질문 정리


1. [앙상블이란?](#1-앙상블이란)
    - [왜 앙상블 모델이 개별 모델보다 일반적으로 더 좋은 성능을 보이나요?](#q1)
    - [단일 모델보다 앙상블이 유리한 상황은 어떤 경우일까요?](#q2)
    - [앙상블 방식의 한계는 무엇이라고 생각하시나요?](#q3)
2. [앙상블 방법에는 어떤 것들이 있나요?](#2-앙상블-방법에는-어떤-것들이-있나요)
    - [각각의 방식이 학습 구조나 성능에 어떤 차이를 보이나요?](#q4)
    - [Voting은 보통 어떤 상황에서 사용되나요?](#q5)
    - [VotingClassifier에서 서로 다른 모델을 썼을 때 발생할 수 있는 이슈는?](#q6)
    - [Random Forest에서 Feature Importance를 측정하는 방법은?](#q7)
    - [Stacking에서 사용되는 메타 모델은 어떻게 선택하나요?](#q8)
3. [앙상블 방법을 활용한 모델에는 어떤 것들이 있나요?](#3-앙상블-방법을-활용한-모델에는-어떤-것들이-있나요)
    - [RandomForest는 어떤 앙상블 방식에 기반한 모델인가요?](#q9)
    - [LightGBM이 Gradient Boosting보다 빠른 이유를 설명하세요.](#q10)
    - [CatBoost는 범주형 데이터 처리에서 어떤 점이 특별한가요?](#q11)
    - [실무에서 가장 많이 사용하는 앙상블 모델은?](#q12)
4. [각각의 앙상블 방법에 대한 장점과 단점은?](#4-각각의-앙상블-방법에-대한-장점과-단점은)
    - [Boosting 기법이 편향을 줄이는 이유는?](#q13)
    - [Bagging 기법이 분산을 줄이는 방식은?](#q14)
    - [Stacking은 언제 효과적이고, 언제 비효율적인가요?](#q15)
    - [가장 많이 사용되는 앙상블 방식은?](#q16)

---

## 1. 앙상블이란?

> 여러 개의 예측 모델을 결합하여, 단일 모델보다 더 나은 성능을 도출하고자 하는 기법입니다. 모델 간의 예측 결과를 조합함으로써 분산을 줄이고 일반화 성능을 향상시키는 데 목적이 있습니다.

### 💬 Follow-up Questions

<a name="q1"></a>
<details>
<summary><strong>왜 앙상블 모델이 개별 모델보다 일반적으로 더 좋은 성능을 보이나요?</strong></summary>

<br>

앙상블은 여러 개의 예측 모델을 결합하여 단일 모델보다 일반적으로 더 높은 예측 성능을 내는 기법입니다.

핵심 원리는 **오류의 상호 보완**입니다.  
서로 다른 방식으로 학습된 모델들은 각기 다른 오류를 범하고, 한 모델의 예측 오류가 다른 모델에 의해 보완되면서 전체적인 성능이 향상됩니다.

앙상블이 효과적이기 위해선 모델 간 **다양성(Diversity)** 이 확보되어야 하며, 그 방법은 다음과 같습니다:

- 서로 다른 알고리즘을 사용하는 방식  
  예: 로지스틱 회귀, KNN, 결정 트리 등
- 데이터 샘플을 다르게 나누어 훈련하는 방식 → **Bagging**
- 샘플에 가중치를 부여하여 반복 학습하는 방식 → **Boosting**


하지만 실무에서는 앙상블 모델이 항상 정답은 아닙니다.  
추론 속도, 복잡도, 해석력 부족 등의 이슈로 인해 단일 모델이 선호될 때도 있습니다.  
따라서 **예측 성능 향상이 명확한 경우에만** 사용하는 것이 일반적입니다.

</details>

<a name="q2"></a>
<details>
<summary><strong>단일 모델보다 앙상블이 유리한 상황은 어떤 경우일까요?</strong></summary>

(답변 작성)

</details>

<a name="q3"></a>
<details>
<summary><strong>앙상블 방식이 항상 좋은 결과를 보장하진 않는데, 그 한계는 뭐라고 생각하시나요?</strong></summary>

(답변 작성)

</details>

---

## 2. 앙상블 방법에는 어떤 것들이 있나요?

> 대표적인 앙상블 기법으로는 Voting, Bagging, Boosting, Stacking이 있으며, 각각의 방식은 모델 결합 방식과 학습 전략에 따라 구분됩니다.

### 💬 Follow-up Questions

<a name="q4"></a>
<details><summary><strong>각각의 방식이 학습 구조나 성능에 어떤 차이를 보이나요?</strong></summary>(답변 작성)</details>

<a name="q5"></a>
<details><summary><strong>Voting은 보통 어떤 상황에서 사용되나요?</strong></summary>(답변 작성)</details>

<a name="q6"></a>
<details><summary><strong>VotingClassifier에서 서로 다른 모델을 썼을 때 발생할 수 있는 이슈는?</strong></summary>(답변 작성)</details>

<a name="q7"></a>
<details><summary><strong>Random Forest에서 Feature Importance를 측정하는 방법은?</strong></summary>(답변 작성)</details>

<a name="q8"></a>
<details><summary><strong>Stacking에서 사용되는 메타 모델은 어떻게 선택하나요?</strong></summary>(답변 작성)</details>

---

## 3. 앙상블 방법을 활용한 모델에는 어떤 것들이 있나요?

> 앙상블 기법을 실제 모델로 구현한 대표적인 알고리즘에는 다음과 같은 것들이 있습니다:
> - **VotingClassifier** (Voting)
> - **RandomForest, ExtraTrees** (Bagging)
> - **AdaBoost, GradientBoosting, XGBoost, LightGBM, CatBoost** (Boosting)
> - **StackingClassifier** (Stacking)

### 💬 Follow-up Questions

<a name="q9"></a>
<details><summary><strong>RandomForest는 어떤 앙상블 방식에 기반한 모델인가요?</strong></summary>(답변 작성)</details>

<a name="q10"></a>
<details><summary><strong>LightGBM이 Gradient Boosting보다 빠른 이유를 설명하세요.</strong></summary>(답변 작성)</details>

<a name="q11"></a>
<details><summary><strong>CatBoost는 범주형 데이터 처리에서 어떤 점이 특별한가요?</strong></summary>(답변 작성)</details>

<a name="q12"></a>
<details><summary><strong>실무에서 가장 많이 사용하는 앙상블 모델은?</strong></summary>(답변 작성)</details>

---

## 4. 각각의 앙상블 방법에 대한 장점과 단점은?

> 각 기법은 성능 향상과 일반화 측면에서 다양한 장점을 가지지만, 동시에 복잡성이나 과적합 등의 단점도 존재합니다.

| 방법     | 장점                             | 단점                                |
|----------|----------------------------------|-------------------------------------|
| Voting   | 다양한 모델 결합, 간단한 구조     | 단순 평균이므로 성능 개선 한계      |
| Bagging  | 과적합 감소, 분산 제어            | 편향 줄이기는 어려움                |
| Boosting | 성능 우수, 편향 보완              | 과적합 위험, 학습 시간 증가         |
| Stacking | 모델 조합 시너지, 일반화 능력 우수 | 구현 복잡, 데이터 누수 주의 필요   |

### 💬 Follow-up Questions

<a name="q13"></a>
<details><summary><strong>Boosting 기법이 편향을 줄이는 이유는?</strong></summary>(답변 작성)</details>

<a name="q14"></a>
<details><summary><strong>Bagging 기법이 분산을 줄이는 방식은?</strong></summary>(답변 작성)</details>

<a name="q15"></a>
<details><summary><strong>Stacking은 언제 효과적이고, 언제 비효율적인가요?</strong></summary>(답변 작성)</details>

<a name="q16"></a>
<details><summary><strong>가장 많이 사용되는 앙상블 방식은?</strong></summary>(답변 작성)</details>

---

## References
- https://github.com/andrewekhalel/MLQuestions


