function [returnVal] = valueAt(t, thing)
% Thrust at Specific Time
global burntime thrust0 m_dot Mo;

switch thing
    case 'thrust'
        if t <= burntime
            returnVal = thrust0;
        else
            returnVal = 0;
        end
    case 'mass'
        if t <= burntime
            returnVal = Mo - (m_dot * t);
        else
            returnVal = Mo - (m_dot * burntime);
        end
    otherwise
        returnVal = 0;
end

end

