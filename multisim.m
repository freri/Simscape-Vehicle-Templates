simstorun = 100;
numsims = 0;
RL_params.m =  1500;
RL_params.Iz = 2066;
RL_params.Lf = 1.412;
RL_params.Lr = 1.412;
RL_params.Cr = 15000;
RL_params.Cf = 15000;
RL_params.tau = 0.5;
RL_params.V0 = 0;
RL_params.f_cg = zeros(7,1);
% sim_param_idx = 6;
% RL_params.m =  jsonFile.Simulations(sim_param_idx).RL.ModelParams.m(end);
% RL_params.Iz = jsonFile.Simulations(sim_param_idx).RL.ModelParams.Iz(end);
% RL_params.Lf = jsonFile.Simulations(sim_param_idx).RL.ModelParams.L(end);
% RL_params.Lr = jsonFile.Simulations(sim_param_idx).RL.ModelParams.Lf(end);
% RL_params.Cr = jsonFile.Simulations(sim_param_idx).RL.ModelParams.Cr(end);
% RL_params.Cf = jsonFile.Simulations(sim_param_idx).RL.ModelParams.Cf(end);
% RL_params.tau = jsonFile.Simulations(sim_param_idx).RL.ModelParams.tau(end);
% RL_params.V0 = jsonFile.Simulations(sim_param_idx).RL.ModelParams.V0(end);
% RL_params.f_cg = jsonFile.Simulations(sim_param_idx).RL.ModelParams.f_cr(:,end);

Maneuver.Trajectory.vx.Value = Maneuver.Trajectory.vx.Value;
while numsims < simstorun
    numsims = numsims + 1;
    sim('sm_car',305)
    RL_params.m =    squeeze(mpc_log.model_params.Data(1,:,end));
    RL_params.Iz =   squeeze(mpc_log.model_params.Data(2,:,end));
    RL_params.Lf =   squeeze(mpc_log.model_params.Data(3,:,end));
    RL_params.Lr =   squeeze(mpc_log.model_params.Data(4,:,end));
    RL_params.Cr =   squeeze(mpc_log.model_params.Data(5,:,end));
    RL_params.Cf =   squeeze(mpc_log.model_params.Data(6,:,end));
    RL_params.tau =  squeeze(mpc_log.model_params.Data(7,:,end));
    RL_params.V0 =   squeeze(mpc_log.model_params.Data(8,:,end));
    RL_params.f_cg = squeeze(mpc_log.model_params.Data(9:15,:,end));
end