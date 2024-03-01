(defun c:DrawRectWithMouse ()
  (setq p1 (getpoint "\nѡ���һ����: "))
  (setq p2 (getpoint p1 "\nѡ��ڶ�������ȷ�����ε�һ����: "))
  ;; �����һ���ߵķ��������ͳ���
  (setq dx (- (car p2) (car p1)))
  (setq dy (- (cadr p2) (cadr p1)))
  ;; ��ȡ����������ȷ�����εĿ�Ⱥͷ���
  (setq p3 (getpoint "\n�ƶ����ȷ�����εĿ�Ⱥͷ���: "))
  
  ;; ����p1��p3������
  (setq dx1 (- (car p3) (car p1)))
  (setq dy1 (- (cadr p3) (cadr p1)))
  
  ;; ����p1��p2����������
  (setq len (sqrt (+ (* dx dx) (* dy dy))))
  
  ;; ���������p3��p1p2�ߵĴ�ֱ����
  (setq width (abs (/ (- (* dx1 dy) (* dy1 dx)) len)))
  
  ;; ȷ����ֱ��������
  (setq vx (/ dy len))
  (setq vy (- (/ dx len)))
  
  ;; �ж�p3�����p1p2��λ����������ȵķ���
  (setq side (if (< (* dx1 dy) (* dy1 dx)) -1 1))
  
  ;; ������ε�����������
  (setq p4 (list (+ (car p1) (* side vx width)) (+ (cadr p1) (* side vy width))))
  (setq p5 (list (+ (car p2) (* side vx width)) (+ (cadr p2) (* side vy width))))
  
  ;; ���ƾ���
  (command "._pline" p1 p2 p5 p4 "c")
  (princ)
)
