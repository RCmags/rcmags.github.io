function [filter] = continuityFilter(angles)
    %% Filter to remove discontinuity of atan2() function near angle = +-PI
    % This process ensures the numerical derivatives of said angle are continuous

    % axis lengths
    len_y = length( angles(:,1) );
    len_x = length( angles(1,:) );

    % copy inputs
    filter = angles;

    % scan axes
    for y = 1:len_y
        offset = 0;

        for x = 3:len_x       % x >=3
            % estimate current value via past slope
            angle_now = angles(y, x);
            angle_last = angles(y, x-1);
            angle_last2 = angles(y, x-2);

            angle_expected = 2*angle_last - angle_last2;

            % accumulate rotations
            if (angle_expected < -pi) && (angle_now > 0)
                offset = offset - 2*pi;
            elseif (angle_expected > pi) && (angle_now < 0)
                offset = offset + 2*pi;
            end

            % offset input values
            filter(y, x) = filter(y, x) + offset;
        end
    end
end
