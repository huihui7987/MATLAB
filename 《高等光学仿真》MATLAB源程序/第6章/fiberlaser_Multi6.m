function  Pout = fiberlaser_Multi6
    global R1 R2 Pp sigma_ap sigma_ep sigma_as sigma_es gamma_s k...
        gamma_p N alpha_p alpha_s Pssat Ppsat mu k eta Nequs Nfiber

    %参数设置
    lambda_s = 1100 * 1e-9;
    lambda_p = 974 * 1e-9;
    tau = 0.8e-3;
    sigma_ap = 26e-21*1e-4;
    sigma_ep = 26e-21*1e-4;
    sigma_as = 1e-23*1e-4;
    sigma_es = 1.6e-21*1e-4;
    A_c = 3.1416e-10;
    N = 5.5351e+025;
    alpha_p = 2e-5*1e2;
    alpha_s = 4e-6*1e2;
    gamma_s = 0.82;
    gamma_p = 0.0024;
    R1 =.99;
    R2 =.035;
    L = 40;

    %物理常数及中间过程参数计算
    c = 3e8;
    h = 6.626e-34;
    nu_s = c/lambda_s;
    nu_p = c/lambda_p;
    Pssat = h * nu_s * A_c/( gamma_s * (sigma_es+sigma_as) * tau);
    Ppsat = h * nu_p * A_c/( gamma_p * (sigma_ep+sigma_ap) * tau);


    eta = 0.01;
    mu = 0.123;
    Nequs = 4;
    Nfiber = 5;
    Pp = 100*ones(1,Nfiber-1);

    %端面抽运的光纤激光器边值问题数值求解
    k(1) = 1/L;
    k(Nfiber) = k(1);
    k(2:Nfiber-1) = (1-k(1)-k(Nfiber))/(Nfiber-2);

    %端面抽运的光纤激光器边值问题数值求解
    OPTION = bvpset('Stats','ON');
    solinit = bvpinit(linspace(0,L,10),[0 1 50 50 Pp(1) 2 80 ... 
        40 Pp(2) Pp(3) 150  30  10 Pp(4) 300 20 1 0 250 15]);
    sol = bvp4c(@f,@fsbc,solinit);

    %数值计算结果分析和显示
    x = [k(1)*sol.x  k(2)*sol.x+L*k(1)  k(3)*sol.x+L*sum(k(1:2))...
        k(4)*sol.x+L*sum(k(1:3))  k(5)*sol.x+L*sum(k(1:4))];
    y = [sol.y(1:4,:) sol.y(5:8,:) sol.y(9:12,:)...
        sol.y(13:16,:) sol.y(17:20,:) ];
    nz = [(sigma_ap/(sigma_ap+sigma_ep)*(y(1,:)+y(2,:))/Ppsat+...
        sigma_as/(sigma_as+sigma_es)*(y(3,:)+y(4,:))/Pssat)./...
        ((y(1,:)+y(2,:))/Ppsat+1+(y(4,:)+y(3,:))/Pssat)];
    gz = gamma_s*((sigma_as+sigma_es)*nz-sigma_as)*N-alpha_s;
    Pout = y(3,end)*(1-R2);


    figure
    subplot(2,1,1)
    plot(x,y(1,:),'b.-',x,y(2,:),'g*-',x,y(3,:),'r',x,y(4,:),'k--');
    grid on;
    title('Pump and laser powers');
    legend('Pp+(z)','Pp-(z)','Ps+(z)','Ps-(z)');
    xlabel('Position z (m)');
    ylabel('Power (W)');
    subplot(2,1,2)
    plot(x,nz)
    grid on;
    title('Relative population density')
    xlabel('Position z (m)');
    ylabel('N_2/N');

%多点抽运的光纤激光器速率方程组
function dy = f(x,y)
    global sigma_ap sigma_ep sigma_as sigma_es gamma_s gamma_p...
        N alpha_p alpha_s Pssat Ppsat k Nfiber Nequs
    for i = 0:Nfiber-1
        N2(i+1)=N*(sigma_ap/(sigma_ap+sigma_ep)*(y(1+i*Nequs)+...
            y(2+i*Nequs))/Ppsat+sigma_as/(sigma_as+sigma_es)*...
            (y(3+i*Nequs)+y(4+i*Nequs))/Pssat)/((y(1+i*Nequs)+...
            y(2+i*Nequs))/Ppsat+1+(y(3+i*Nequs)+y(4+i*Nequs))/Pssat);
        dy(1+i*Nequs)=k(i+1)*(-gamma_p*(sigma_ap*N-(sigma_ap+...
            sigma_ep)*N2(i+1))-alpha_p)*y(1+i*Nequs);
        dy(2+i*Nequs)=-k(i+1)*(-gamma_p*(sigma_ap*N-(sigma_ap+...
            sigma_ep)*N2(i+1))-alpha_p)*y(2+i*Nequs);
        dy(3+i*Nequs)=k(i+1)*(gamma_s*((sigma_as+sigma_es)*...
            N2(i+1)-sigma_as*N)-alpha_s)*y(3+i*Nequs);
        dy(4+i*Nequs)=-k(i+1)*(gamma_s*((sigma_as+sigma_es)*...
            N2(i+1)-sigma_as*N)-alpha_s)*y(4+i*Nequs);
    end

%多点抽运的光纤激光器边界条件
function res = fsbc(y0,yL)
    global R1 R2 Pp eta mu Nequs
    res = [y0(1)
       yL(2)-y0(2+1*Nequs)*(1-mu)
       y0(3)-R1*y0(4)
       yL(4)-y0(4+1*Nequs)*(1-eta)
       y0(1+1*Nequs)-yL(1)*(1-mu)-Pp(1)
       yL(2+1*Nequs)-y0(2+2*Nequs)*(1-mu)
       y0(3+1*Nequs)-yL(3)*(1-eta)
       yL(4+1*Nequs)-y0(4+2*Nequs)*(1-eta)
       y0(1+2*Nequs)-yL(1+1*Nequs)*(1-mu)-Pp(2)
       yL(2+2*Nequs)-y0(2+3*Nequs)*(1-mu)-Pp(3)
       y0(3+2*Nequs)-yL(3+1*Nequs)*(1-eta)
       yL(4+2*Nequs)-y0(4+3*Nequs)*(1-eta)
       y0(1+3*Nequs)-yL(1+2*Nequs)*(1-mu)
       yL(2+3*Nequs)-y0(2+4*Nequs)*(1-mu)-Pp(4)
       y0(3+3*Nequs)-yL(3+2*Nequs)*(1-eta)
       yL(4+3*Nequs)-y0(4+4*Nequs)*(1-eta)
       y0(1+4*Nequs)-yL(1+3*Nequs)*(1-mu)
       yL(2+4*Nequs)
       y0(3+4*Nequs)-yL(3+3*Nequs)*(1-eta)
       yL(4+4*Nequs)-R2*yL(3+4*Nequs)*(1-eta)];