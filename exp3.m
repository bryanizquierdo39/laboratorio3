clc; clear; close all;

% Solicitar método
metodo = input('Seleccione metodo (1=Biseccion, 2=Newton, 3=Secante, 4=Comparativo): ');

% Función
f = @(x) x.*cos(x) - 1;
df = @(x) cos(x) - x.*sin(x); % derivada

tol = 1e-6;

switch metodo
    case 1 % BISECCION
        a = input('Ingrese extremo inferior a: ');
        b = input('Ingrese extremo superior b: ');
        
        if f(a)*f(b) > 0
            error('No hay cambio de signo en el intervalo');
        end
        
        iter = 0;
        while true
            c = (a+b)/2;
            iter = iter + 1;
            
            if abs(f(c)) < tol
                break;
            end
            
            if f(a)*f(c) < 0
                b = c;
            else
                a = c;
            end
        end
        
        fprintf('\nMetodo Biseccion\n');
        fprintf('Raiz: %.8f\nIteraciones: %d\nError: %.8e\n', c, iter, abs(f(c)));

    case 2 % NEWTON-RAPHSON
        x = input('Ingrese valor inicial x0: ');
        
        iter = 0;
        while true
            x_new = x - f(x)/df(x);
            iter = iter + 1;
            
            if abs(f(x_new)) < tol
                break;
            end
            
            x = x_new;
        end
        
        fprintf('\nMetodo Newton-Raphson\n');
        fprintf('Raiz: %.8f\nIteraciones: %d\nError: %.8e\n', x_new, iter, abs(f(x_new)));

    case 3 % SECANTE
        x0 = input('Ingrese x0: ');
        x1 = input('Ingrese x1: ');
        
        iter = 0;
        while true
            x2 = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
            iter = iter + 1;
            
            if abs(f(x2)) < tol
                break;
            end
            
            x0 = x1;
            x1 = x2;
        end
        
        fprintf('\nMetodo Secante\n');
        fprintf('Raiz: %.8f\nIteraciones: %d\nError: %.8e\n', x2, iter, abs(f(x2)));

    case 4 % COMPARATIVO
        % ---- BISECCION ----
        a = 0.6; b = 0.7;
        iter_b = 0;
        while true
            c = (a+b)/2;
            iter_b = iter_b + 1;
            if abs(f(c)) < tol, break; end
            if f(a)*f(c) < 0
                b = c;
            else
                a = c;
            end
        end
        
        % ---- NEWTON ----
        x = 0.5;
        iter_n = 0;
        while true
            x_new = x - f(x)/df(x);
            iter_n = iter_n + 1;
            if abs(f(x_new)) < tol, break; end
            x = x_new;
        end
        
        % ---- SECANTE ----
        x0 = 0.5; x1 = 0.7;
        iter_s = 0;
        while true
            x2 = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
            iter_s = iter_s + 1;
            if abs(f(x2)) < tol, break; end
            x0 = x1;
            x1 = x2;
        end
        
        fprintf('\n===== RESULTADOS =====\n');
        fprintf('Biseccion -> Raiz: %.8f | Iter: %d\n', c, iter_b);
        fprintf('Newton    -> Raiz: %.8f | Iter: %d\n', x_new, iter_n);
        fprintf('Secante   -> Raiz: %.8f | Iter: %d\n', x2, iter_s);
        
        % Comparación
        fprintf('\nConclusión:\n');
        fprintf('Newton-Raphson converge más rápido (menos iteraciones).\n');
        fprintf('Secante es intermedio.\n');
        fprintf('Bisección es más lento pero siempre converge.\n');
end