DATAS SEGMENT
    a DW 14h,75h,23h,52h,10h,07h,39h,12h,61h,57h,14h,00h,41h,73h,42h,35h
DATAS ENDS

STACKS SEGMENT
   	DW 10 dup(?)
STACKS ENDS

CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS 
    
START:
	mov ax,DATAS
	mov ds,ax
	
	mov cx,10h          ;ִ��16��ĸѭ��
	dec cx
	
loop1:
	push cx             ;cx��ջ����֮���ջ����
	mov bx,0            ;bx��Ϊ��ѭ�����ݵ�ַƫ����
	
loop2:
	mov ax,a[bx]
	cmp ax,a[bx+2]      ;�Ƚ�a[bx]��a[bx+2]�����ݴ�С
	jge continue        ;jleΪת��ָ��������a[bx]���ڻ����a[bx+2]����ת��continue��ִ�У��������˳��ִ��
	xchg ax,a[bx+2]     ;��a[bx]��a[bx+2]���ݽ���
	mov a[bx],ax

continue:
	add bx,2            ;bx��ַƫ����+2
	loop loop2          ;cx=cx-1����ʱ���cx������0����ת��loop2�Σ����cx����0����һ��ĸѭ����ɣ�����˳��ִ��
	pop cx              ;cx��ջ
	loop loop1          ;cx=cx-1����ʱ���cx������0����ת��loop1�Σ����cx����0����ȫ��ĸѭ����ɣ�����˳��ִ��
	
CODES ENDS              ;�������ν���

    END START           ;�������